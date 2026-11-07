CREATE TABLE [dbo].[ItemType]
(
    [ItemTypeId] INT NOT NULL PRIMARY KEY,
    [ItemType] CHAR(1) NOT NULL,
    [Description] VARCHAR(100) NULL,
    [CreatedAt]     DATETIME2         NOT NULL CONSTRAINT DF_ItemType_CreatedAt DEFAULT GETDATE(),
    
    CONSTRAINT PK_ItemType PRIMARY KEY (ItemTypeId),
    CONSTRAINT UQ_ItemType_TypeCode UNIQUE (TypeCode)
)