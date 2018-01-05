import Vue from 'vue/dist/vue.esm';
import ElementUI from 'element-ui';
import locale from 'element-ui/lib/locale/lang/ja';
import 'element-ui/lib/theme-chalk/index.css'

import DeviseRegistrationsNewView from 'views/devise/registrations/new.vue';

Vue.use(ElementUI, {locale});

// creating a new vue instance
const integrationIndex = new Vue({
    el: '#devise-registrations-new-view',
    components: {
        'devise-registrations-new-view': DeviseRegistrationsNewView
    }
});
