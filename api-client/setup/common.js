const DUMMY_OID = '0a0a0a0a0a0a0a0a0a0a0a0a';

const VALID_USER = {
  username: 'valid',
  password: 'aaaa',
};

const VALID_USER_2 = {
  username: 'othervalid',
  password: 'bbbb',
};

const EXPIRED_TOKEN = [
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9',
  'eyJpZCI6IjVjOGViMjhlZDY5Mjk3NWRhNDY1Mzg5NCIsImlhdCI6MTU1Mjg1NTY5NCwiZXhwIjoxNTUyOTQyMDk0fQ',
  'YF_IxVjelsTP_vQxJJyEFcFwV8Ip3c-6LPMFA0Yc91o',
].join('.');

const passToken = (token) => ({ headers: { 'x-access-token': token } });

module.exports = {
  DUMMY_OID,
  VALID_USER,
  VALID_USER_2,
  EXPIRED_TOKEN,
  passToken,
};
