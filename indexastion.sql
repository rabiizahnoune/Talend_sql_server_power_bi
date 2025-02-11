
CREATE INDEX IDX_customer_id ON [dbo].[customer_dim](customer_key)
CREATE INDEX IDX_product_id ON [dbo].[dim_product](product_key_cat);
CREATE INDEX IDX_date_id ON [dbo].[dim_date](date_key);

create index IDX_sales_customer_id on [dbo].[sales_fact](customer_key)
create index IDX_sales_product_id on [dbo].[sales_fact](product_key_cat)
create index IDX_sales_date_id on [dbo].[sales_fact](Date_key)

create index IDX_inventory_customer_id on [dbo].[invetory_fact](customer_key)
create index IDX_inventory_product_id on [dbo].[invetory_fact](product_key_cat)
create index IDX_inventory_date_id on [dbo].[invetory_fact](Date_key);
