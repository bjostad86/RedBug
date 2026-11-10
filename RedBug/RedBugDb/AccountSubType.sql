CREATE TABLE [dbo].[AccountSubType]
(
    [AccountSubTypeId]  INT IDENTITY(1,1)   NOT NULL,
    [AccountSubType]    CHAR(1)             NOT NULL,
    [Description]       VARCHAR(100)        NULL,
    [CreatedAt]         DATETIME            NOT NULL CONSTRAINT DF_AccountSubType_CreatedAt DEFAULT GETDATE(),

    CONSTRAINT PK_AccountSubType PRIMARY KEY (AccountSubTypeId),
    CONSTRAINT UQ_AccountSubType_SubTypeCode UNIQUE (AccountSubType)
)
GO