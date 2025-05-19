/*
  Warnings:

  - You are about to drop the column `costPoints` on the `MenuItem` table. All the data in the column will be lost.
  - You are about to drop the column `costPoints` on the `PremiumPlan` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `PremiumPlan` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `PremiumPlan` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Purchase` table. All the data in the column will be lost.
  - You are about to drop the column `itemId` on the `Purchase` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `Purchase` table. All the data in the column will be lost.
  - You are about to drop the column `amountDeducted` on the `Transaction` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Transaction` table. All the data in the column will be lost.
  - You are about to drop the column `pointsAdded` on the `Transaction` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `Transaction` table. All the data in the column will be lost.
  - You are about to drop the column `bankBalance` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `User` table. All the data in the column will be lost.
  - Added the required column `cost_points` to the `MenuItem` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cost_points` to the `PremiumPlan` table without a default value. This is not possible if the table is not empty.
  - Added the required column `item_id` to the `Purchase` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `Purchase` table without a default value. This is not possible if the table is not empty.
  - Added the required column `amount_deducted` to the `Transaction` table without a default value. This is not possible if the table is not empty.
  - Added the required column `points_added` to the `Transaction` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `Transaction` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "PremiumPlan" DROP CONSTRAINT "PremiumPlan_userId_fkey";

-- DropForeignKey
ALTER TABLE "Purchase" DROP CONSTRAINT "Purchase_itemId_fkey";

-- DropForeignKey
ALTER TABLE "Purchase" DROP CONSTRAINT "Purchase_userId_fkey";

-- DropForeignKey
ALTER TABLE "Transaction" DROP CONSTRAINT "Transaction_userId_fkey";

-- AlterTable
ALTER TABLE "MenuItem" DROP COLUMN "costPoints",
ADD COLUMN     "cost_points" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "PremiumPlan" DROP COLUMN "costPoints",
DROP COLUMN "createdAt",
DROP COLUMN "userId",
ADD COLUMN     "cost_points" INTEGER NOT NULL,
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "user_id" TEXT;

-- AlterTable
ALTER TABLE "Purchase" DROP COLUMN "createdAt",
DROP COLUMN "itemId",
DROP COLUMN "userId",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "item_id" TEXT NOT NULL,
ADD COLUMN     "user_id" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Transaction" DROP COLUMN "amountDeducted",
DROP COLUMN "createdAt",
DROP COLUMN "pointsAdded",
DROP COLUMN "userId",
ADD COLUMN     "amount_deducted" INTEGER NOT NULL,
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "points_added" INTEGER NOT NULL,
ADD COLUMN     "user_id" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "User" DROP COLUMN "bankBalance",
DROP COLUMN "createdAt",
ADD COLUMN     "bank_balance" INTEGER NOT NULL DEFAULT 2000,
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- AddForeignKey
ALTER TABLE "Purchase" ADD CONSTRAINT "Purchase_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Purchase" ADD CONSTRAINT "Purchase_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "MenuItem"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transaction" ADD CONSTRAINT "Transaction_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PremiumPlan" ADD CONSTRAINT "PremiumPlan_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;
