import { DataSource, DataSourceOptions } from 'typeorm';

export const dataSourceOptions: DataSourceOptions = {
  type: 'mysql',
  host: 'localhost',
  port: 3307,
  username: 'root',
  password: 'root',
  database: 'motos',
  synchronize: false,
  entities: ['dist/domain/entities/*.js'],
  migrations: ['dist/migrations/*.js'],
};
const typeormconfig = new DataSource(dataSourceOptions);
export default typeormconfig;
