const example = require("../fixtures/example.json");
const tags = require("../fixtures/tags.json")

describe("Top Page", () => {
  before(() => {
    cy.server();
    cy.route("GET", "**/articles?*", example);
    cy.route("GET", "**/tags", tags);
    cy.visit("/");
  });
  context("Global Feed", () => {
    it("ユーザは投稿されたナレッジを見ることができる", () => {
      const firstKnowledge = cy.get('[data-test="knowledge"]').eq(0);

      firstKnowledge.within(() => {
        cy.get('[data-test="knowledge-title"]').should(
          "have.text",
          "articles title1"
        );

        cy.get('[data-test="knowledge-description"]').should(
          "have.text",
          "articles title1 description"
        );

        cy.get('[data-test="knowledge-author-name"]').should(
          "have.text",
          "user1"
        );

        cy.get('[data-test="knowledge-author-image"]').should(
          "have.attr",
          "src",
          "https://static.productionready.io/images/smiley-cyrus.jpg"
        );

        cy.get('[data-test="knowledge-date"]').should(
          "have.text",
          "February 26, 2020"
        );

        cy.get('[data-test="knowledge-tag"]').should(($tag) => {
          expect($tag).to.have.length(3);
          expect($tag[0]).to.have.text("tag1");
          expect($tag[1]).to.have.text("tag2");
          expect($tag[2]).to.have.text("tag3");
        });
      });
    });

    it("ユーザは投稿されたタグの一覧を見ることができる", () => {
      const tagList = cy.get('[data-test="tag-list"]');
      tagList.should('exist');
      tagList.should('contain', 'tag1');
      tagList.should('contain', 'tag2');
      tagList.should('contain', 'tag3');
    });

    it("ログインしていないユーザはトップページにアクセスしたときGlobalFeedが選択されている", () => {
      const globalFeedTab = cy.get('[data-test="global-feed-tab"]');
      globalFeedTab.should('have.class', 'active');
    });
  });
});
