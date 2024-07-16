import { ConfigService } from '@nestjs/config';

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
      };
    },
    inject: [ConfigService],
  },
];
