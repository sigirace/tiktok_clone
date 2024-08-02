import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp();

export const onVideoCreated = functions.firestore
  .document("videos/{videoId}")
  .onCreate(async (snapshot, context) => {
    const spawn = require("child-process-promise").spawn;
    const video = snapshot.data();
    try {
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
      await storage.bucket().upload(`/tmp/${snapshot.id}.jpg`, {
        destination: `thumbnails/${snapshot.id}.jpg`,
      });
    } catch (error) {
      console.error("Error processing video:", error);
    }
  });
