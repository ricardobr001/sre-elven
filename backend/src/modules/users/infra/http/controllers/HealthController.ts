import { Request, Response } from 'express';

export default class HealthController {
  async health(request: Request, response: Response): Promise<Response> {
    return response.status(200).send({message: 'ok'});
  }
}
