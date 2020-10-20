<template>
  <v-card
    color="grey lighten-4"
    light
  >
    <v-card-text>
      <content-section
        id="timeline"
        :title="detailed ? 'My Life in a Nutshell' : 'My Experiences'"
      >
        <template slot="actions">
          <div>
            <v-switch
              v-model="detailed"
              :label="detailed ? 'Detailed' : 'Summary'"
            />
          </div>
        </template>

        <v-timeline
          dense
        >
          <v-timeline-item
            v-for="(item, i) in orderedItems"
            :key="i"
            :icon="item.icon || ''"
            :class="{transparent: item.transparent}"
            large
          >
            <template
              v-if="item.iconImage"
              v-slot:icon
            >
              <v-avatar>
                <img
                  :src="publicPath(item.iconImage)"
                >
              </v-avatar>
            </template>
            <template v-slot:opposite />
            <v-layout>
              <v-flex
                v-if="$vuetify.breakpoint.smAndUp"
                md1
                sm2
                align-self-center
              >
                <span>{{ item.year }}</span>
              </v-flex>
              <v-flex
                md11
                sm10
                xs12
              >
                <v-card class="elevation-1">
                  <v-card-title class="pb-0">
                    <div>
                      <p v-if="$vuetify.breakpoint.xsOnly">
                        {{ item.year }}
                      </p>
                      <h3>{{ item.title }}</h3>
                    </div>
                  </v-card-title>
                  <v-card-text>
                    <v-layout wrap>
                      <v-flex
                        :md7="!!item.image"
                        :md12="!item.image"
                        xs12
                      >
                        <div class="mr-1">
                          <span
                            v-if="item.text"
                            class="pre"
                          >{{ item.text }}</span>
                          <!-- eslint-disable vue/no-v-html -->
                          <div
                            v-else-if="item.html"
                            v-html="item.html"
                          />
                          <!-- eslint-enable vue/no-v-html -->
                        </div>
                      </v-flex>
                      <v-flex
                        v-if="item.image"
                        md5
                        xs12
                      >
                        <div
                          class="mt-2"
                        >
                          <v-carousel
                            v-if="Array.isArray(item.image)"
                            :show-arrows="false"
                            :height="325"
                          >
                            <v-carousel-item
                              v-for="(citem,ci) in item.image"
                              :key="ci"
                              :src="publicPath(citem)"
                            />
                          </v-carousel>
                          <v-img
                            v-else
                            :max-height="item.imageHeight ? item.imageHeight : ''"
                            :src="publicPath(item.image)"
                          />
                        </div>
                      </v-flex>
                    </v-layout>
                  </v-card-text>
                </v-card>
              </v-flex>
            </v-layout>
          </v-timeline-item>
        </v-timeline>
      </content-section>
    </v-card-text>
  </v-card>
</template>

<script>
import ContentSection from '@/views/dark-template/content/Section'
export default {
  name      : 'Timeline',
  components: { ContentSection },
  data      : () => ({
    detailed: true,
    items   : [
      {
        detailed   : true,
        transparent: true,
        year       : '1990',
        title      : 'Born on August 17, 1990',
        html       : 'With a chance of %0.00000000000512.<br>I\'m completely aware of value of the life!',
        icon       : 'mdi-cake-variant',
      },
      {
        detailed   : true,
        transparent: true,
        year       : '2004',
        title      : 'Touched a Mouse',
        html       : 'ME: "Woooow!"<br><i>... Of course got slapped later!</i>',
        icon       : 'mdi-mouse-variant',
      },
      {
        detailed   : true,
        year       : '2010',
        transparent: true,
        title      : 'Started as a freelancer on my second year in college',
        icon       : 'mdi-web',
        html       : `
            <p>
                It was November 19, 2010 that one of my profesor asked me to assist his nephew doing his thesis.
            </p>
            <p>
                Since then, I'm doing freelance work to support my college tuition.
            </p>
        `,
      },
      {
        detailed   : true,
        year       : '2013',
        transparent: true,
        title      : 'New Revass Tool',
        html       : `
            <p>
                Role: Developer.<br />
                Client: <a href="https://www.telkomsel.com">PT. Telekomunikasi Seluler .Tbk</a>.<br />
            </p>
            <p>
                Project Description:<br />
                The project's goal is to supports Telkomsel’s Revenue Assurance division.<br />
            </p>
            <p>
                Responsibilities/Contribution & Accomplishment:
                <ul>
                  <li>Create Hgrid Workflow.</li>
                  <li>Developing application based on business analyst.</li>
                  <li>Create Running Script.</li>
                  <li>Developing with Shellscript.</li>
                  <li>Monitors application execution and resolves issues on application development.</li>
                </ul>
            </p>
        `,
        iconImage: './img/timeline/tsel-icon.png',
      },
      {
        detailed   : true,
        year       : '2014',
        transparent: true,
        title      : 'REDBRICK',
        html       : `
            <p>
                Role: Developer.<br />
                Client: <a href="https://www.telkomsel.com">PT. Telekomunikasi Seluler .Tbk</a>.<br />
            </p>
            <p>
                Project Description:<br />
                Red Brick is an early implementation of Revenue Assurance at Telkomsel. Its goals are to ensure billing data (prepaid & post paid) processing accuracy, and to avoid or minimize revenue leakage.<br />
            </p>
            <p>
                Responsibilities/Contribution & Accomplishment:
                <ul>
                  <li>Create Hgrid Workflow.</li>
                  <li>Developing application based on business analyst.</li>
                </ul>
            </p>
        `,
        iconImage: './img/timeline/tsel-icon.png',
      },
      {
        detailed   : true,
        year       : '2015',
        transparent: true,
        title      : 'DIAMOND Stock Health Check Index (SHCI)',
        html       : `
            <p>
                Role: Developer.<br />
                Client: <a href="https://www.telkomsel.com">PT. Telekomunikasi Seluler .Tbk</a>.<br />
            </p>
            <p>
                Project Description:<br />
                In 2015, Telkomsel has limited distribution in term of SIM card and Sales Area. It is expected to be more effective to deliver SIM card to end user. Furthermore, the parameter of effective sales is if there are usage and or recharge from new sales activation. Additionally, we need to define parameter of sales effectiveness to ensure quality of SHCI subscriber. Moreover, SHCI is a mechanism to grouping category of sales base on usage and recharge to determine quality of sales.<br />
            </p>
            <p>
                Responsibilities/Contribution & Accomplishment:
                <ul>
                  <li>Create Hgrid Workflow.</li>
                  <li>Developing application based on business analyst.</li>
                </ul>
            </p>
        `,
        iconImage: './img/timeline/tsel-icon.png',
      },
      {
        detailed   : true,
        year       : '2015 - 17',
        transparent: true,
        title      : 'DIAMOND OMS - DSI POI',
        html       : `
            <p>
                Role: Developer Analyst.<br />
                Client: <a href="https://www.telkomsel.com">PT. Telekomunikasi Seluler .Tbk</a>.<br />
            </p>
            <p>
                Project Description:<br />
                Increasing revenue & CB is not only about prepaid but also post paid. Compared to others competitor, Telkomsel post paid performance is outstanding. Growth and market share is dominant. Our challenge is internal target itself, we have to reach double digit growth. Using BAU channel & selling method is not enough. Remove barrier that post paid is identic with difficulties of apply and Grapari channel. Post paid have to easy to get & easy to use, that’s why kartu Halo have to go retail with great supporting tools & system.<br />
            </p>
            <p>
                Responsibilities/Contribution & Accomplishment:
                <ul>
                  <li>Create Hgrid Workflow.</li>
                  <li>Developing application based on business analyst.</li>
                  <li>Create Running Script.</li>
                  <li>Developing with Shellscript.</li>
                  <li>Monitors application execution and resolves issues on application development.</li>
                </ul>
            </p>
        `,
        iconImage: './img/timeline/tsel-icon.png',
      },
      {
        detailed   : true,
        year       : '2016 - 17',
        transparent: true,
        title      : 'HDPISAT – Subscriber (Source Check & Validation Subs, CVM)',
        html       : `
            <p>
                Role: Developer.<br />
                Client: <a href="https://indosatooredoo.com">PT. Indosat .Tbk</a>.<br />
            </p>
            <p>
                Project Description:<br />
                Hadoop Data Processing is a platform which dealing with big size data in batch or even real time process. The Hadoop data processing will enhance and raise the capability of data analysis which needed by Indosat business users, for handling future challenge which will be more complex in terms of data analysis, data volume and data speed.<br />
            </p>
            <p>
                Responsibilities/Contribution & Accomplishment:
                <ul>
                  <li>Create Hgrid Workflow.</li>
                  <li>Developing application based on business analyst.</li>
                  <li>Create Running Script.</li>
                  <li>Developing with Shellscript.</li>
                  <li>Monitors application execution and resolves issues on application development.</li>
                </ul>
            </p>
        `,
        iconImage: './img/timeline/indosat-icon.ico',
      },
      {
        detailed   : true,
        year       : '2016 - 17',
        transparent: true,
        title      : 'Vgrid – Voracity Hgrid Gateway',
        html       : `
            <p>
                Role: Developer.<br />
                Client: <a href="https://www.iriworldwide.com/en-us">IRI Company</a>.<br />
            </p>
            <p>
                Project Description:<br />
                Build server-side application that act as a gateway for Hadoop orchestration tools.<br />
            </p>
            <p>
                Responsibilities/Contribution & Accomplishment:
                <ul>
                  <li>Create Rest API.</li>
                  <li>Developing application based on business analyst.</li>
                  <li>Create Running Script.</li>
                  <li>Developing with <a href="https://nodejs.org/">Nodejs</a> + <a href="https://www.mongodb.com//">MongoDB</a>.</li>
                </ul>
            </p>
        `,
        iconImage: './img/timeline/iri-icon.ico',
      },
      {
        year : '2013 - 17',
        title: 'PT. Dua Empat Tujuh',
        html : `
                <p>
                    <a href="https://www.solusi247.com/">Solusi247</a> is an integrated solution for Information Communication Technology (ICT). This service was established on August 2000 from group of people with more than 13 year experience in ICT industry.
                </p>
                <p>
                    The company services focus on consultation, especially for Database and Data Warehouse solution (the core competence of Solusi247), although not to close the hardware and network solution, as part of integration of those core solutions.
                </p>
                <p>
                    Main responsibilities:
                    <ul>
                      <li>Create Hgrid Workflow</li>
                      <li>Create running script.</li>
                      <li>Develop and Maintenance application based on business analyst.</li>
                      <li>Monitors application execution and resolves issues on application development.</li>
                    </ul>
                </p>
        `,
        image    : './img/timeline/247.jpg',
        iconImage: './img/timeline/247-icon.png',
      },
      {
        detailed   : true,
        year       : '2017 - 19',
        transparent: true,
        title      : 'Heolys',
        html       : `
            <p>
                Role: Backend Developer.<br />
                Client: <a href="http://heolys.fr">HEOLYS</a>
            </p>
            <p>
                HEOLYS is a start-up specializing in the field of mobile application development created by the founders of e-Conception. Since its launch, it has been joined by private and institutional investors (BPI in particular) in order to consolidate its growth. It is made up of a complete team (network administrators, consultants / advisers, backend and mobile developers, graphic designers, ergonomists).
            </p>
            <p>
                Heolys’s breakthrough in the field of mobile applications is based on a unique know-how in geolocation without network coverage, the deployment of private social networks and dynamic information feedback. The engine of our smartphone applications is continuously optimized by our team of 10 developers and graphic designers working in our development studio. This allows for up-to-date developments using the latest technologies available.<br />
            </p>
            <p>
                Main Responsibilities:
                <ul>
                  <li>Develop and Maintenance Rest APIs.</li>
                  <li>Develop and Maintenance applications based on business analyst.</li>
                  <li>Create Running Scripts.</li>
                  <li>Developing with <a href="https://symfony.com/">Symfony</a> Framework.</li>
                </ul>
            </p>
            <p>
                Delivered Projects:
                <ul>
                  <li><a href="https://play.google.com/store/apps/details?id=fr.econception.heolys">Heolys</a></li>
                  <li><a href="https://play.google.com/store/apps/details?id=fr.appsolute.naturapass">NaturaPass</a></li>
                  <li><a href="https://play.google.com/store/apps/details?id=fr.econception.vigifaune">Vigifaune</a></li>
                  <li><a href="https://play.google.com/store/apps/details?id=com.econception.football.fbbp">FBBP01</a></li>
                  <li><a href="https://play.google.com/store/apps/details?id=fr.econception.soup">Pépinières SOUPE</a></li>
                  <li><a href="https://play.google.com/store/apps/details?id=fr.econception.siti">Siti</a></li>
                  <li><a href="https://play.google.com/store/apps/details?id=fr.econception.semprita">Semprita</a></li>
                  <li><a href="https://play.google.com/store/apps/details?id=fr.econception.jumping">Jumping Place</a></li>
                </ul>
            </p>
        `,
        iconImage: './img/timeline/heolys-icon.png',
      },
      {
        year       : '2018 - 19',
        transparent: false,
        title      : 'Fondaco',
        html       : `
            <p>
                Role: Backend Developer. (Freelance)<br />
                Client: <a href="http://www.fondacodental.com/">Fondaco</a>
            </p>
            <p>
                Founded in 1984 by Mr Fonda, Fondaco Dental Group has grown steadily and enhanced its services to the dental professions through inspired innovations and technology. We are constantly striving towards customer driven services, focusing on enhancing one stop solution of TOP manufacturers of dental equipment, supplies and consumable. With highly skilled dedicated to twenty four hours services back up, Fondaco Dental Group has earned a strong trust of its now extensive client base, spread throughout this huge archipelago.
            </p>
            <p>
                A commitment to education and training for both clients and staff has underpinned the success of Fondaco Dental. Regular professional seminars utilizing international experts locally and internationally, have become a must attend events within our education community.
            </p>
            <p>
                Main Responsibilities:
                <ul>
                  <li>Develop and Maintenance Rest API.</li>
                  <li>Develop admin page based on business analyst.</li>
                  <li>Developing with <a href="https://laravel.com/">Laravel  </a> Framework.</li>
                </ul>
            </p>
            <p>
                Delivered Projects:
                <ul>
                  <li><a href="https://play.google.com/store/apps/details?id=com.fondacoshop">Fondaco</a></li>
                </ul>
            </p>
        `,
        iconImage: './img/timeline/fondaco-icon.png',
        image    : [
          './img/timeline/fondaco-0.jpg',
          './img/timeline/fondaco-1.jpg',
          './img/timeline/fondaco-2.jpg',
        ],
      },
      {
        detailed   : true,
        year       : '2019 - 20',
        transparent: true,
        title      : 'Solene-R Platforme',
        html       : `
            <p>
                Role: Backend Developer.<br />
                Client: <a href="https://www.solene-r.com/">SOLENE-R</a>
            </p>
            <p>
                Project Description:<br />
                <a href="https://plateforme.solene-r.com//">SOLENE-R Platforme</a> is a Document Management System which transform the conventional management system into digital.
            </p>
            <p>
                Responsibilities/Contribution & Accomplishment:
                <ul>
                  <li>Develop and Maintenance Rest API.</li>
                  <li>Develop and Maintenance application based on business analyst.</li>
                  <li>Developing with <a href="https://laravel.com/">Laravel</a> Framework.</li>
                </ul>
            </p>
        `,
        iconImage: './img/timeline/solene-icon.png',
      },
      {
        year       : '2019',
        transparent: false,
        title      : 'Kreditpro',
        html       : `
            <p>
                Role: Backend Developer. (Freelance)<br />
                Client: <a href="https://kreditpro.id/">Kreditpro</a>
            </p>
            <p>
                KreditPro is Financial Technology company based in Indonesia, with main purpose to provide loan using peer-to-peer lending mechanism. It aims to bridge lender and borrower through innovative and safe platform without the intermediaries of banks and other financial institutions.
            </p>
            <p>
                Main Responsibilities:
                <ul>
                  <li>Develop Rest APIs</li>
                  <li>Develop admin page based on business analyst.</li>
                  <li>Developing with <a href="https://lumen.laravel.com/">Lumen</a> + <a href="https://laravel.com/">Laravel</a> Framework.</li>
                </ul>
            </p>
        `,
        iconImage: './img/timeline/kreditpro-icon.png',
        image    : './img/timeline/kreditpro.jpg',
      },
      {
        detailed   : true,
        year       : '2019 - 20',
        transparent: true,
        title      : 'BTWN',
        html       : `
            <p>
                Role: Backend Developer.<br />
                Client: <a href="https://btwnapp.us/">b.plat llc. US</a><br />
            </p>
            <p>
                Project Description:<br />
                <a href="https://play.google.com/store/apps/details?id=us.b2ween.app">BTWN</a> is a marketing platform created by b.plat LLC in 2017 with the purpose to revolutionize referral marketing by using a patented technology that automates the word-of-mouth referral process.So businesses can reward happy customers, without having to track referral codes of links.
            </p>
            <p>
                Responsibilities/Contribution & Accomplishment:
                <ul>
                  <li>Develop and Maintenance Rest API.</li>
                  <li>Develop and Maintenance application based on business analyst.</li>
                  <li>Create Running Script.</li>
                  <li>Developing with <a href="https://nodejs.org/">Nodejs</a> + <a href="https://www.mongodb.com//">MongoDB</a>.</li>
                </ul>
            </p>
        `,
        image    : './img/timeline/btwn.png',
        iconImage: './img/timeline/btwn-icon.jpg',
      },
      {
        year : '2017 - 20',
        title: 'PT. Mindo Small Business Solutions',
        html : `
            <p>
                <a href="https://mindosolutions.com/">MINDO</a> is a full service outsourcing partner dedicated to helping small and medium sized businesses achieve their goals.
            </p>
            <p>
                The company services focus on consultation, especially for Database and Data Warehouse solution (the core competence of Solusi247), although not to close the hardware and network solution, as part of integration of those core solutions.
            </p>
            <p>
                Main responsibilities:
                <ul>
                  <li>Develop and Maintenance Rest APIs</li>
                  <li>Create running script.</li>
                  <li>Develop and Maintenance application based on business analyst.</li>
                </ul>
            </p>
        `,
        image    : './img/timeline/mindo.jpg',
        iconImage: './img/timeline/mindo-icon.png',
      },
      {
        year : '2020 - 2021',
        title: 'PT. Solusi Pembayaran Elektronik',
        html : `
          <p>
              Current status: <span class="orange--text lighten-1">6 months contract until March 2021</span>
          </p>
            <p>
                <a href="https://spesolution.com/">SPE</a> is a company who provide financial management technology platform solutions for modern business.
            </p>
            <p>
                SPE provides high end solutions to enhance its client technology systems. Based on its experience and knowledge in Financial Technology (FinTech) fields for more than 6 years, SPE helped its clients build end-to-end financial technology solutions. SPE has specialists in the field of payment solutions development and management, payment gateways, e-commerce, switching, chain management systems, smart community, gamification, and also merchant management.
            </p>
            <p>
                Current responsibilities:
                <ul>
                  <li>Maintain Back Office Web Portal and Services.</li>
                  <li>Use <a href="https://www.yiiframework.com/">Yii2 Framework</a>, <a href="https://www.mysql.com/">MySQL</a>, <a href="https://www.mongodb.com/">MongoDB</a>, and <a href="https://docker.com/">Docker</a> for orchestration</li>
                </ul>
            </p>
        `,
        image    : './img/timeline/spe.jpg',
        iconImage: './img/timeline/spe-icon.png',
      },
      {
        year : '2020 - Present',
        title: 'Homker (Freelance)',
        html : `
            <p>
                Current status: <span class="orange--text lighten-1">Development on Progress</span>
            </p>
            <p>
                <a href="https://homker.co.id/">Homker</a> is a platform for health care services, homker makes it easy for users to provide health care services without having to leave the house. Users also able to make an appointment with a provider that is available on the homker service.
            </p>
            <p>
                Current responsibilities:
                <ul>
                    <li>Develop backend REST API using <a href="https://laravel.com/">Laravel</a> framework for mobile apps and web portal.</li>
                </ul>
            </p>
        `,
        image    : './img/timeline/homker.jpg',
        iconImage: './img/timeline/homker-icon.png',
      },
      {
        year : '2020 - Present',
        title: 'Dotdotread (Freelance)',
        html : `
            <p>
                Current status: <span class="orange--text lighten-1">Development on Progress</span>
            </p>
            <p>
                <a href="https://dotdotread.com/">Dotdotread</a> is a platform for busy book lovers. Dotdotread goal is to summarize the content of the book objectively, so that readers can absorb the key points of the book in the least time.
            </p>
            <p>
                Current responsibilities:
                <ul>
                    <li>Develop backend REST API using <a href="https://nestjs.com/">NestJS</a> framework for mobile apps and web portal.</li>
                </ul>
            </p>
        `,
        image    : './img/timeline/ddr.jpg',
        iconImage: './img/timeline/ddr-icon.png',
      },
    ],
  }),
  computed: {
    orderedItems () {
      const items = [...this.items].reverse()
      if (this.detailed)
        return items
      return items.filter((item) => {
        return !item.detailed
      })
    },
  },
}
</script>

<style scoped>
.title {
  border-bottom: 2px #bfbfbf solid;
  line-height: 1.5 !important;
}
.pre {
  white-space: pre;
}
.transparent{
  opacity: 0.6;
}
.v-avatar img, .v-avatar .v-icon, .v-avatar .v-image {
  background: white;
}
</style>
