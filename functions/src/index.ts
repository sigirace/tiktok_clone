import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp();

export const onVideoCreated = functions.firestore
  .document("videos/{videoId}")
  .onCreate(async (snapshot, context) => {
    const spawn = require("child-process-promise").spawn;
    const video = snapshot.data();

    await spawn("ffmpeg", [
      "-i", // input
      video.fileUrl, // file location
      "-ss", // move timeline
      "00:00:01.00", // start time
      "-vframes", // frame
      "1", // frame count
      "-vf", // video filter
      "scale=150:-1", // 가로 150, 세로 -1 영상 너비에 맞춰서 높이 설정
      `/tmp/${snapshot.id}.jpg`,
    ]);
    const storage = admin.storage();
    const [file, _] = await storage.bucket().upload(`/tmp/${snapshot.id}.jpg`, {
      destination: `thumbnails/${snapshot.id}.jpg`,
    });

    await file.makePublic();
    await snapshot.ref.update({ thumbnailUrl: file.publicUrl() });
    const db = admin.firestore();

    await db
      .collection("users")
      .doc(video.creatorUid)
      .collection("videos")
      .doc(snapshot.id)
      .set({ thumbnailUrl: file.publicUrl(), videoId: snapshot.id });
  });

export const onLikedCreated = functions.firestore
  .document("likes/{likeId}")
  .onCreate(async (snapshot, context) => {
    const db = admin.firestore();
    const [videoId, _] = snapshot.id.split("-");
    await db
      .collection("videos")
      .doc(videoId)
      .update({ likes: admin.firestore.FieldValue.increment(1) });
    const video = (await db.collection("videos").doc(videoId).get()).data();
    if (video) {
      const creatorUid = video.creatorUid;
      const user = (await db.collection("users").doc(creatorUid).get()).data();
      if (user) {
        const token = user.token;
        await admin.messaging().send({
          token: token,
          data: {
            screen: "123",
          },
          notification: {
            title: "someone liked your video.",
            body: "Likes + 1 ! Congrats! 💖",
          },
        });
      }
    }
  });

export const onLikedRemoved = functions.firestore
  .document("likes/{likeId}")
  .onDelete(async (snapshot, context) => {
    const db = admin.firestore();
    const [videoId, _] = snapshot.id.split("-");
    await db
      .collection("videos")
      .doc(videoId)
      .update({ likes: admin.firestore.FieldValue.increment(-1) });
  });
