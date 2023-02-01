import axios from 'axios';

export const baseURL = 'http://10.0.2.2:3333';

export const baseURLify = (url: string): string => {
  return `${baseURL}${
    !baseURL.endsWith('/') && !url.startsWith('/') ? '/' : ''
  }${url}`;
};

const api = axios.create({
  baseURL,
});

export default api;
