import {onCall} from "firebase-functions/v2/https";
import {getFirestore} from "firebase-admin/firestore";

export const getUserProfile = onCall(async (request) => {
  const uid = request.auth?.uid;
  if (!uid) throw new Error("Unauthenticated");

  const doc = await getFirestore().collection("users").doc(uid).get();
  return doc.exists ? doc.data() : null;
});
