import IMailTemplateProvider from '../models/IMailTemplateProvider';

export default class FakeMailTamplateProvider implements IMailTemplateProvider {
  async parse(): Promise<string> {
    return 'Mail content';
  }
}
