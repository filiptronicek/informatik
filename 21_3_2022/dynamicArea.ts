const getArea = (a: number, b: number) => a * b;

const a = parseInt(prompt("Zadej obsah pro a") || "", 10);
const b = parseInt(prompt("Zadej obsah pro b") || "", 10);

class InputError extends Error {}

if (!isNaN(a) && !isNaN(b) && Math.min(a, b) > 0) {
  document.write(
    `Obsah obdelníka se stranami a=${a}cm, b=${b}cm je ${getArea(a, b)} cm²`
  );
} else {
  throw new InputError("Neplatný vstup");
}
