const example = require("../fixtures/example.json");

describe("Top Page", () => {
  before(() => {
    cy.server();
    cy.route("GET", "**/articles?*", example);
    cy.visit("/");
  });
  context("Global Feed", () => {
    it("ユーザは投稿されたナレッジを見ることができる", () => {
      cy.get('[data-test="knowledge"] [data-test="knowledge-title"]')
        .eq(0)
        .should("have.text", "articles title1");
    });
  });
});
