import Vue from 'vue/dist/vue.esm';
import ElementUI from 'element-ui';
import locale from 'element-ui/lib/locale/lang/ja';
import 'element-ui/lib/theme-chalk/index.css'

import DevisePasswordsEditView from 'views/devise/passwords/edit.vue';

Vue.use(ElementUI, {locale});

// creating a edit vue instance
const integrationIndex = new Vue({
    el: '#devise-passwords-edit-view',
    components: {
        'devise-passwords-edit-view': DevisePasswordsEditView
    }
});

