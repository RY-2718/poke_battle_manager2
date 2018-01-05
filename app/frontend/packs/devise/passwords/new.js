import Vue from 'vue/dist/vue.esm';
import ElementUI from 'element-ui';
import locale from 'element-ui/lib/locale/lang/ja';
import 'element-ui/lib/theme-chalk/index.css'

import DevisePasswordsNewView from 'views/devise/passwords/new.vue';

Vue.use(ElementUI, {locale});

// creating a new vue instance
const integrationIndex = new Vue({
    el: '#devise-passwords-new-view',
    components: {
        'devise-passwords-new-view': DevisePasswordsNewView
    }
});
