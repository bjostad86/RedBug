CREATE TABLE [dbo].[AccountType]
(
    [AccountTypeId]     INT IDENTITY(1,1)   NOT NULL,
    [AccountType]       CHAR(1)             NOT NULL,
    [Description]       VARCHAR(100)        NULL,
    [CreatedAt]         DATETIME            NOT NULL CONSTRAINT DF_AccountType_CreatedAt DEFAULT GETDATE(),

    CONSTRAINT PK_AccountType PRIMARY KEY (AccountTypeId),
    CONSTRAINT UQ_AccountType_TypeCode UNIQUE (AccountType)
)
GO