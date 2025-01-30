import { defineConfig } from 'vite';
import path from 'path';

export default defineConfig({
  build: {
    rollupOptions: {
      input: {
        main: path.resolve(__dirname, 'index.html'), // Optional main entry point
        'section1': path.resolve(__dirname, 'sections/Section 1/index.html'),
        'section2': path.resolve(__dirname, 'sections/Section 2/index.html'),
        // ... all other sections
        'section3': path.resolve(__dirname, 'sections/Section 3/index.html'),
        'section43': path.resolve(__dirname, 'sections/Section 43/index.html'),
      },
    },
  },
  //base: '/my-project/', // Uncomment if needed
});