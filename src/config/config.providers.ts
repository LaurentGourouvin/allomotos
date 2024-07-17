import { ConfigService } from '@nestjs/config';
import { join } from 'path';

export const configProviders = [
  {
    provide: 'DATABASE_CONFIG',
    useFactory: (configService: ConfigService) => {
      console.log('Initialize configuration...');
      return {
        type: 'mysql',
        host: configService.get<string>('DATABASE_HOST'),
        port: configService.get<number>('DATABASE_PORT'),
        username: configService.get<string>('DATABASE_USER'),
        password: configService.get<string>('DATABASE_PASSWORD'),
        database: configService.get<string>('DATABASE_NAME'),
        entities: ['dist/domain/entities/*.js'],
        migrations: ['dist/migrations/*.js'],
        // migrations: [join(__dirname, '../../migrations/**/*{.ts,.js}')],
        synchronize: false,
      };
    },
    inject: [ConfigService],
  },
];
