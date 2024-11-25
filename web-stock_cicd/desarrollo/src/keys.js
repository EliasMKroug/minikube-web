module.exports = {
    database: {
      host: process.env.DB_HOST || 'localhost', // Usar mysql-service como host
      user: process.env.DB_USER || 'root',
      password: process.env.DB_PASSWORD || '',
      database: process.env.DB_DATABASE || 'db_products',
    },
  };


/* module.exports = {
    database: {
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'db_products'
    }

} */