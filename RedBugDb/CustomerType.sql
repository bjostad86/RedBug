CREATE TABLE [dbo].[CustomerType]
(
    [CustomerTypeId]    INT IDENTITY(1,1)   NOT NULL,
    [CustomerType]      VARCHAR(50)         NOT NULL,
    [Notes]             VARCHAR(MAX)      NULL,
    [IsActive]          BIT               NOT NULL CONSTRAINT DF_CustomerType_IsActive DEFAULT 1,
    [CreatedAt]         DATETIME          NOT NULL CONSTRAINT DF_CustomerType_CreatedAt DEFAULT GETDATE(),
    [UpdatedAt]         DATETIME          NULL,
    
    CONSTRAINT PK_Customer_Type PRIMARY KEY (CustomerTypeId)
)