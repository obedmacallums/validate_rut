const validateRut = (rut) => {
  /*  important:
      rut string allowed: from 6 to 10 digits + "-" character + one digit or K or k
      return True if pass module 11 validation
      return False if dont pass module 11 validation
      module 11:
      for more details view http://www.pgrocer.net/Cis51/mod11.html */

  const regex_rut = /^[0-9]{6,10}-[\dkK]$/;

  if (rut.match(regex_rut)) {
    const reversed_rut = rut.split("").reverse().join("").slice(2);
    const dv = rut.slice(-1);
    let dv_num = null;

    if ((dv === "k") | (dv === "K")) {
      dv_num = 10;
    } else if (dv === "0") {
      dv_num = 11;
    } else {
      dv_num = parseInt(dv);
    }
    let sum = 0;
    let multiple = 1;
    for (let i = 0; i < reversed_rut.length; i++) {
      if (multiple < 7) {
        multiple++;
      } else {
        multiple = 2;
      }
      sum = sum + parseInt(reversed_rut[i]) * multiple;
    }

    let modulo_11 = 11 - (sum % 11);

    if (modulo_11 === dv_num) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
};

export default validateRut;
