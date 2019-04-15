export const assertInt = (value) => {
  if (value === undefined || value === null || value === '') return 0;
  if (Number.isNaN(value)) return 0;
  if (Number.isNaN(parseInt(value, 10))) return 0;
  return parseInt(value, 10);
}

export const assertFloat = (value) => {
  if (value === undefined || value === null || value === '') return 0.00;
  if (Number.isNaN(value)) return 0.00;
  if (Number.isNaN(parseFloat(value))) return 0.00;
  return parseFloat(value);
}
