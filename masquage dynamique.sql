-- Masquage des emails (affiche uniquement la première lettre et le domaine)
ALTER TABLE customer_dim 
ALTER COLUMN CustomerEmail ADD MASKED WITH (FUNCTION = 'email()');

-- Masquage des numéros de téléphone (remplace tous les chiffres sauf les deux extrêmes)
ALTER TABLE customer_dim 
ALTER COLUMN CustomerPhone ADD MASKED WITH (FUNCTION = 'partial(2,"XXXXXXX",2)');

ALTER TABLE customer_dim 
ALTER COLUMN customerName ADD MASKED WITH (FUNCTION = 'partial(1, "XXXXX", 0)');


