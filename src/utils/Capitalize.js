/**
 * @param {*} str
 * @returns the string capitalized
 */
const capitalize = (str) => {
  if (!str || typeof str !== 'string') {
    return '';
  }
  return str.toString().charAt(0).toUpperCase() + str.toString().slice(1).toLowerCase();
};

export default capitalize;
