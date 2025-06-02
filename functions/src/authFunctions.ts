import {onCall} from "firebase-functions/v2/https";
import {getAuth} from "firebase-admin/auth";

export const registerUser = onCall(async (request) => {
  const {email, password} = request.data;

  if (!email || !password) {
    throw new Error("Missing fields");
  }

  const userRecord = await getAuth().createUser({email, password});
  return {uid: userRecord.uid};
});

export const loginUser = onCall(async (request) => {
  throw new Error("Use Firebase client SDK to sign in");
});
