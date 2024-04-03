const nestedModule = {
  type: 'input',
  name: 'args',
  message: "Write args in method:model:state in comma separated values",
  result: (data) => {
    return data.split(',').map((v) => {
      const split = v.split(':');
      return {
        module: split[0],
        model: split[1],
        state: split[2],
      };
    });
  }
};

module.exports = [
  nestedModule,
];
