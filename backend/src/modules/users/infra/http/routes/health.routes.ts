import { Router } from 'express';

import HealthController from '../controllers/HealthController';

const healthRouter = Router();
const healthController = new HealthController();

healthRouter.get(
  '/',
  healthController.health,
);

export default healthRouter;
