const getArea = (a: number, b: number) => a * b;

const a = 2;
const b = 5;

class InputError extends Error {
    constructor(message: string) {
        super(message);
    }
}

if (Number.isNaN(parseInt(a.toString())) || a < 0 || Number.isNaN(parseInt(b.toString())) || b < 0) {
    throw new InputError('Strana musí být kladné číslo');
}

console.log(`Obsah obdelníka se stranami a=${a}cm, b=${b}cm je ${getArea(a, b)} cm²`);

