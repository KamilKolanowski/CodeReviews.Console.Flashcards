SET QUOTED_IDENTIFIER ON;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET ANSI_NULLS ON;

CREATE DATABASE Flashcards;
GO

USE Flashcards;
GO

CREATE SCHEMA TCSA;
GO

CREATE TABLE Flashcards.TCSA.Stacks (
    StackId INT PRIMARY KEY IDENTITY(1,1),
    StackName VARCHAR(100) NOT NULL,
    Description VARCHAR(255) NOT NULL,
    DateCreated DATETIME2(7) NOT NULL DEFAULT CURRENT_TIMESTAMP
);
GO

CREATE TABLE Flashcards.TCSA.Cards (
   FlashcardId INT PRIMARY KEY IDENTITY(1,1),
   StackId INT NOT NULL FOREIGN KEY REFERENCES Flashcards.TCSA.Stacks(StackId),
   FlashcardTitle VARCHAR(100) NOT NULL,
   FlashcardContent VARCHAR(500) NOT NULL,
   DateCreated DATETIME2(7) NOT NULL DEFAULT CURRENT_TIMESTAMP
);
GO

ALTER TABLE Flashcards.TCSA.Stacks
    REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE);
GO

ALTER TABLE Flashcards.TCSA.Cards
    REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE);
GO
