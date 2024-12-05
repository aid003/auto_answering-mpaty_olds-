/*
  Warnings:

  - You are about to alter the column `idTg` on the `Users` table. The data in that column could be lost. The data in that column will be cast from `Int` to `BigInt`.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Users" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "role" TEXT NOT NULL DEFAULT 'Client',
    "idTg" BIGINT NOT NULL
);
INSERT INTO "new_Users" ("id", "idTg", "role") SELECT "id", "idTg", "role" FROM "Users";
DROP TABLE "Users";
ALTER TABLE "new_Users" RENAME TO "Users";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
