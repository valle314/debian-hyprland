import { fileURLToPath, URL } from 'node:url'

import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vitejs.dev/config/
export default defineConfig({
    plugins: [ vue(), ],

    css: {
        preprocessorOptions: {
            scss: {
                additionalData: `
                @import "@/scss/global.scss";
                `
                // you can also use multiple files like this
                // `
                // @import "@/assets/vars.scss";
                // @import "@/assets/another.scss";
                // `
            }
        }
    },

    server: {
        open: true,
        port: 5173,
    },

    resolve: {
        alias: {
            '@': fileURLToPath(new URL('./src', import.meta.url))
        }
    }
})

