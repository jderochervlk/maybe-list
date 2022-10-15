module.exports = {
    moduleFileExtensions: ["js"],
    testEnvironment: "jsdom",
    testMatch: [
        "**/__tests__/**/*_test.bs.js",
    ],
    transform: {
        "\\.[jt]sx?$": "babel-jest"
    },
}