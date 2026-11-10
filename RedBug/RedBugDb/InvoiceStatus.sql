CREATE TABLE dbo.InvoiceStatus 
(
    [StatusId]      INT             NOT NULL,
    [StatusCode]    VARCHAR(20)     NOT NULL,
    [Description]   VARCHAR(100)    NOT NULL,
    [SortOrder]     INT             NOT NULL CONSTRAINT DF_InvoiceStatus_Sort DEFAULT 0,
    [IsClosed]      BIT             NOT NULL CONSTRAINT DF_InvoiceStatus_IsClosed DEFAULT 0,  -- Paid / Void: excluded from open receivables
    [IsActive]      BIT             NOT NULL CONSTRAINT DF_InvoiceStatus_IsActive DEFAULT 1,
    [CreatedAt]     DATETIME       NOT NULL CONSTRAINT DF_InvoiceStatus_CreatedAt DEFAULT GETDATE(),
    
    CONSTRAINT PK_InvoiceStatus PRIMARY KEY (StatusId),
    CONSTRAINT UQ_InvoiceStatus_StatusCode UNIQUE (StatusCode)
);
GO