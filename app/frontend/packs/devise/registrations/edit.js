import Vue from 'vue/dist/vue.esm';
import ElementUI from 'element-ui';
import locale from 'element-ui/lib/locale/lang/ja';
import 'element-ui/lib/theme-chalk/index.css'

import DeviseRegistrationsEditView from 'views/devise/registrations/edit.vue';

Vue.use(ElementUI, {locale});

// creating a edit vue instance
const integrationIndex = new Vue({
    el: '#devise-registrations-edit-view',
    components: {
        'devise-registrations-edit-view': DeviseRegistrationsEditView
    }
});
