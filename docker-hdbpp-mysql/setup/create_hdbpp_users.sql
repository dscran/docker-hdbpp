CREATE USER 'hdbpprw'@'%' IDENTIFIED BY 'hdbpprw';
CREATE USER 'hdbppro'@'%' IDENTIFIED BY 'hdbppro';

GRANT ALL ON hdbpp.* TO 'hdbpprw'@'%';
GRANT SELECT ON hdbpp.* TO 'hdbppro'@'%';

FLUSH PRIVILEGES;
