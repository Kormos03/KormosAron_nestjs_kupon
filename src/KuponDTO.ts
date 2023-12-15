export class KuponDTO {
    id: number;
    title: string;
    percentage: number;
    code: string;

    constructor(id: number, title: string, percentage: number, code: string) {


        this.id = id;
        this.title = title;
        this.percentage = percentage;
        this.code = code;
    }
}

/**
 *  if (title.length < 1) {
            throw new Error('Title must have at least 1 character');
        }
        if (percentage < 1 || percentage > 99) {
            throw new Error('Percentage must be between 1 and 99');
        }
        if (!code.match(/^[a-zA-Z]{4}-\d{6}$/)) {
            throw new Error('Code format must be: charcharcharchar-NNNNNN');
        }
 */

