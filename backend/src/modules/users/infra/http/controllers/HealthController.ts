import { Request, Response } from 'express';
import { getConnection } from 'typeorm';

export default class HealthController {
  async health(request: Request, response: Response): Promise<Response> {
    await getConnection().runMigrations({ transaction: 'all' });
    return response.status(200).send({message: 'ok'});
  }
}
