/*
  Warnings:

  - Added the required column `avatarUrl` to the `Users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `guthubId` to the `Users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `login` to the `Users` table without a default value. This is not possible if the table is not empty.

*/
-- CreateTable
CREATE TABLE "memory" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "usersId" TEXT NOT NULL,
    "coverUrl" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "isPublic" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "memory_usersId_fkey" FOREIGN KEY ("usersId") REFERENCES "Users" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Users" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "guthubId" INTEGER NOT NULL,
    "nome" TEXT NOT NULL,
    "login" TEXT NOT NULL,
    "avatarUrl" TEXT NOT NULL
);
INSERT INTO "new_Users" ("id", "nome") SELECT "id", "nome" FROM "Users";
DROP TABLE "Users";
ALTER TABLE "new_Users" RENAME TO "Users";
CREATE UNIQUE INDEX "Users_guthubId_key" ON "Users"("guthubId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
