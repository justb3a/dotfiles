module.exports = {
  config: {
    fontSize: 12,
    fontFamily: 'Menlo, Hack,  "DejaVu Sans Mono", "Lucida Console", monospace',
    cursorShape: 'BEAM',

    bell: false,
    windowSize: [ 900, 600 ],
    padding: '4px',

    cursorColor: 'rgba(248,28,229,0.75)',
    backgroundColor: '#000',
    foregroundColor: '#fff',
    borderColor: '#333',
    colors: {
      black: '#000000',
      red: '#ff0000',
      green: '#33ff00',
      yellow: '#ffff00',
      blue: '#0066ff',
      magenta: '#cc00ff',
      cyan: '#00ffff',
      white: '#d0d0d0',
      lightBlack: '#808080',
      lightRed: '#ff0000',
      lightGreen: '#33ff00',
      lightYellow: '#ffff00',
      lightBlue: '#0066ff',
      lightMagenta: '#cc00ff',
      lightCyan: '#00ffff',
      lightWhite: '#ffffff'
    },

    // custom css, better text, no border/margins/rounded stuff
    css: `
      * {
        -webkit-font-feature-settings: "liga" on, "calt" on, "dlig" on !important;
        text-rendering: optimizeLegibility !important;
        font-weight: 500;
      }
      .hyperterm_main {
        border: 0;
        border-radius: 0;
      }
      .splitpane_divider {
        background: #85680f !important;
        border-color: #1d1f21 !important;
      }
    `,

    // custom css to embed in the terminal window
    termCSS: `
      @media (-webkit-max-device-pixel-ratio: 1.3), (max-resolution: 120dpi) {
        x-screen {
          -webkit-font-smoothing: subpixel-antialiased !important;
        }
      }
    `,

    // plugins config
    hyperclean: {
      hideFirstTabBorder: true
    }
  },

  plugins: [
    'hyperclean',
    'hyperterm-1password'
  ],

};
