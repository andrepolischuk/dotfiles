module.exports = {
  config: {
    fontSize: 12,
    fontFamily: 'Menlo, DejaVu Sans Mono, Lucida Console, monospace',
    padding: '10px',
    cursorShape: 'BEAM',
    termCSS: `
      x-screen {
        -webkit-font-smoothing: subpixel-antialiased !important;
      }
    `,
  },
  plugins: [
    'hyper-one-light',
    'hypercwd',
    'hyper-blink',
  ],
};
