import { Controller, Get, Render, Post, Body, Res } from '@nestjs/common';
import * as mysql from 'mysql2';
import { AppService } from './app.service';
import { KuponDTO } from './KuponDTO';
import { Response } from 'express';
import { error } from 'console';

const conn = mysql.createPool({
  host: process.env.DB_HOST || 'localhost',
  port: parseInt(process.env.DB_PORT) || 3306,
  user: process.env.DB_USERNAME || 'root',
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_DATABASE || 'database',
}).promise();

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) { }

  @Get()
  @Render('index')
  async index() {
    const [rows] = await conn.query('SELECT * FROM kuponok');
    const adatok: KuponDTO[] = rows as KuponDTO[];
    const rendezett = adatok.sort((a, b) => a.title.localeCompare(b.title));
    return { adatok: rendezett };
  }

  @Get('newCoupon')
  @Render('newCouponForm')
  barmi() {
    return;
  }

  @Post('newCoupon')
  async newCoupon(@Body() kupon: KuponDTO, @Res() res: Response, err) {
    let errorMessage = '';
    try {


      if (kupon.title.length < 1 || kupon.title.trim() == null) {
        errorMessage = 'Title must have at least 1 character';
        throw new Error(errorMessage);
      }
      if (kupon.percentage < 1 || kupon.percentage > 99 || kupon.percentage == null) {
        errorMessage = 'Percentage must be between 1 and 99';
        throw new Error(errorMessage);
      }
      if (!kupon.code.match(/^[a-zA-Z]{4}-\d{6}$/)) {
        errorMessage = 'Code format must be: charcharcharchar-NNNNNN';
        throw new Error(errorMessage);
      }
      const sql = 'INSERT INTO kuponok (title, percentage, code) VALUES (?, ?, ?)';
      const values = [kupon.title, kupon.percentage, kupon.code];
      await conn.query(sql, values);
      return res.redirect('/');
    }
    catch (e) {

      console.error(e);
      console.log(e)
      return res.render('newcouponForm', { error: e.message });
    }
  }
}
