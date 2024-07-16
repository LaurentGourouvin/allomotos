import { Module } from '@nestjs/common';
import { ConfigModule as NestConfigModule } from '@nestjs/config';
import { configProviders } from './config.providers';

@Module({
  imports: [
    NestConfigModule.forRoot({
      isGlobal: true,
    }),
  ],
  providers: [...configProviders],
  exports: [...configProviders],
})
export class ConfigModule {}
