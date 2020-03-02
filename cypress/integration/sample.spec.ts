const example = require("../fixtures/example.json");

describe("Top Page", () => {
  before(() => {
    cy.server();
    cy.route("GET", "**/articles?*", example);
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
      });
    });
  });
});
