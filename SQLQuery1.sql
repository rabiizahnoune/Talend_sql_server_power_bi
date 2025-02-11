CREATE TRIGGER trg_update_dim_product
ON dbo.dim_product
AFTER INSERT, UPDATE
AS
BEGIN
    -- Mettre à jour l'ancienne ligne pour la marquer comme inactive
    UPDATE dp
    SET dp.EndDate = GETDATE(), dp.IsActive = 0
    FROM dbo.dim_product dp
    INNER JOIN deleted d ON dp.product_id = d.product_id  -- Utilisez la table deleted pour obtenir les anciennes valeurs
    WHERE dp.IsActive = 1  -- Assurez-vous que nous mettons à jour une ligne active
      AND (dp.ProductName != d.ProductName
           OR dp.ProductCategory != d.ProductCategory
           OR dp.ProductPrice != d.ProductPrice)
		   OR dp.ProductSubCategory!=d.ProductSubCategory;

    -- Insérer une nouvelle ligne avec un nouveau surrogate_key
    INSERT INTO dbo.dim_product (product_id, ProductName, ProductCategory,ProductSubCategory, ProductPrice, start_date, EndDate, IsActive)
    SELECT i.product_id, i.ProductName, i.ProductCategory,i.ProductSubCategory, i.ProductPrice, GETDATE(), NULL, 1
    FROM inserted i;
END;
