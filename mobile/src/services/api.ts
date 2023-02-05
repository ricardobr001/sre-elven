import axios from 'axios';
import baseURL from './config'

export const baseURLify = (url: string): string => {
  return `${baseURL}${
    !baseURL.endsWith('/') && !url.startsWith('/') ? '/' : ''
  }${url}`;
};

const api = axios.create({
  baseURL,
});

export default api;
