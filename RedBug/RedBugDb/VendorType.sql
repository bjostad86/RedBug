CREATE TABLE [dbo].[VendorType]
(
    [VendorTypeId]  INT IDENTITY(1,1)   NOT NULL,
    [VendorType]    CHAR(1)             NOT NULL,
    [Description]   VARCHAR(100)        NULL,
    [CreatedAt]     DATETIME            NOT NULL CONSTRAINT DF_VendorType_CreatedAt DEFAULT GETDATE(),

    CONSTRAINT PK_VendorType PRIMARY KEY (VendorTypeId),
    CONSTRAINT UQ_VendorType_TypeCode UNIQUE (VendorType)
)