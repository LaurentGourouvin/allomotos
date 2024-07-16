import { DataSource } from 'typeorm';
import { join } from 'path';
import { ConfigService } from '@nestjs/config';
export const databaseProviders = [
  {
    provide: 'DATA_SOURCE',
    useFactory: async (configService: ConfigService) => {
      console.log('Initialization of the Datesource...');
      const dataSource = new DataSource({
        type: 'mysql',
        host: configService.get<string>('DATABASE_HOST'),
        port: configService.get<number>('DATABASE_PORT'),
        username: configService.get<string>('DATABASE_USER'),
        password: configService.get<string>('DATABASE_PASSWORD'),
        database: configService.get<string>('DATABASE_NAME'),
        entities: [join(__dirname, '/../**/*.entity{.ts,.js}')],
        synchronize: true,
        // logging: true // Display sql queries on the terminal
      });
      try {
        await dataSource.initialize();
        return dataSource;
      } catch (error) {
        console.log('Error during Data Source initialization:', error);
        throw error;
      }
    },
    inject: [ConfigService],
  },
];
