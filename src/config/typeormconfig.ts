import { DataSource, DataSourceOptions } from 'typeorm';
import { join } from 'path';

export const dataSourceOptions: DataSourceOptions = {
  type: 'mysql',
  host: 'db',
  port: 3306,
  username: 'root',
  password: 'root',
  database: 'motos',
  synchronize: false,
  entities: ['dist/domain/entities/*.js'],
  migrations: ['dist/migrations/*.js'],
};

const typeormconfig = new DataSource(dataSourceOptions);
export default typeormconfig;
