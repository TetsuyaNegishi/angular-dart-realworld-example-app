describe('My First Test', function() {
  it('finds the content "type"', function() {
    cy.visit('/')

    cy.contains('Hello Angular')
  })
})