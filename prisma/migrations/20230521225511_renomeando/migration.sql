/*
  Warnings:

  - You are about to drop the column `nome` on the `Users` table. All the data in the column will be lost.
  - Added the required column `name` to the `Users` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Users" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "githubId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "login" TEXT NOT NULL,
    "avatarUrl" TEXT NOT NULL
);
INSERT INTO "new_Users" ("avatarUrl", "githubId", "id", "login") SELECT "avatarUrl", "githubId", "id", "login" FROM "Users";
DROP TABLE "Users";
ALTER TABLE "new_Users" RENAME TO "Users";
CREATE UNIQUE INDEX "Users_githubId_key" ON "Users"("githubId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
