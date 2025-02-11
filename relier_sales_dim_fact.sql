alter table [dbo].[sales_fact]
add constraint fk_sales_customer foreign key (customer_key) references [dbo].[customer_dim](customer_key);

alter table [dbo].[sales_fact]
add constraint fk_sales_product foreign key (product_key_cat) references [dbo].[dim_product](product_key_cat);

alter table [dbo].[sales_fact]
add constraint fk_sales_date foreign key (Date_key) references [dbo].[dim_date](date_key);

alter table [dbo].[sales_fact]
add constraint fk_sales_shiper foreign key (shiper_key) references [dbo].[shiper_dim](shipping_key);


